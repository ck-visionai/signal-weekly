import concurrent.futures
import json
import os
import time
from pathlib import Path

from openai import OpenAI

ROOT = Path(__file__).parent
TOPICS = json.loads((ROOT / "topics.json").read_text())
OUTPUT = ROOT / "drafts"
OUTPUT.mkdir(exist_ok=True)
client = OpenAI()

SCHEMA = {
    "type": "object",
    "properties": {
        "cover_objective": {"type": "string"},
        "decision_title": {"type": "string"},
        "decision_intro": {"type": "string"},
        "orientation": {"type": "string"},
        "read_steps": {"type": "array", "items": {"type": "object", "properties": {"title": {"type": "string"}, "body": {"type": "string"}}, "required": ["title", "body"], "additionalProperties": False}},
        "extraction": {"type": "string"},
        "inventory_intro": {"type": "string"},
        "inventory_steps": {"type": "array", "items": {"type": "object", "properties": {"title": {"type": "string"}, "body": {"type": "string"}}, "required": ["title", "body"], "additionalProperties": False}},
        "project_prompt": {"type": "string"},
        "role_phrase": {"type": "string"},
        "evidence_phrase": {"type": "string"},
        "translation_rule": {"type": "string"},
        "rewrite_prompt": {"type": "string"},
        "fragile": {"type": "string"},
        "defensible": {"type": "string"},
        "credibility_audit": {"type": "string"},
        "worksheet_prompts": {"type": "array", "items": {"type": "object", "properties": {"label": {"type": "string"}, "prompt": {"type": "string"}}, "required": ["label", "prompt"], "additionalProperties": False}},
        "worked_examples": {"type": "array", "items": {"type": "object", "properties": {"before": {"type": "string"}, "after": {"type": "string"}, "insight": {"type": "string"}}, "required": ["before", "after", "insight"], "additionalProperties": False}},
        "transfer_prompt": {"type": "string"},
        "review_steps": {"type": "array", "items": {"type": "object", "properties": {"title": {"type": "string"}, "body": {"type": "string"}}, "required": ["title", "body"], "additionalProperties": False}},
        "rehearsal": {"type": "string"},
        "spoken_prompt": {"type": "string"},
        "action_days": {"type": "array", "items": {"type": "string"}},
        "commitment": {"type": "string"},
        "glossary": {"type": "array", "items": {"type": "object", "properties": {"term": {"type": "string"}, "definition": {"type": "string"}}, "required": ["term", "definition"], "additionalProperties": False}}
    },
    "required": ["cover_objective", "decision_title", "decision_intro", "orientation", "read_steps", "extraction", "inventory_intro", "inventory_steps", "project_prompt", "role_phrase", "evidence_phrase", "translation_rule", "rewrite_prompt", "fragile", "defensible", "credibility_audit", "worksheet_prompts", "worked_examples", "transfer_prompt", "review_steps", "rehearsal", "spoken_prompt", "action_days", "commitment", "glossary"],
    "additionalProperties": False
}

SYSTEM = """You are a senior editorial career strategist writing original educational content for Signal Weekly, a premium career-intelligence publication for mid-career and executive professionals. Write practical, non-promissory guidance. Never promise interviews, offers, salary increases, or employment outcomes. Do not quote, copy, paraphrase closely, or imitate external sources. Do not invent statistics, testimonials, case studies, credentials, company names, legal advice, or copyrighted frameworks. Use only invented generic examples. Every sentence must be original and useful."""

def prompt(topic):
    return f"""Draft structured source content for a 10-page, 20–30-minute reader edition.

Edition: {topic['number']} — {topic['title']}
Subtitle: {topic['subtitle']}
Core focus: {topic['focus']}

Return content for the JSON schema. Requirements:
- Write enough substantive content for roughly 2,000–2,500 words when rendered with worksheet prompts.
- `read_steps`, `inventory_steps`, `worksheet_prompts`, and `review_steps` must each contain exactly 3 or 4 useful items.
- `worked_examples` must contain exactly 2 original generic examples with a weak “before,” a credible “after,” and an explanation.
- `action_days` must contain exactly 6 concrete steps.
- `glossary` must contain exactly 6 plain-language terms relevant to this edition.
- Make the worksheet prompts specific enough to be used with a real career decision.
- Keep examples truthful in style: no invented metrics, named companies or claims of results.
- Use sentence case; avoid markdown; do not include citations or URLs in the generated content."""

def validate(data):
    for key in ("read_steps", "inventory_steps", "worksheet_prompts", "review_steps"):
        if len(data[key]) not in (3, 4):
            raise ValueError(f"{key} must have 3 or 4 items")
    if len(data["worked_examples"]) != 2 or len(data["action_days"]) != 6 or len(data["glossary"]) != 6:
        raise ValueError("fixed-length content requirement failed")
    if sum(len(str(value)) for value in data.values()) < 8500:
        raise ValueError("draft too short for reader-edition standard")

def draft(topic):
    output_path = OUTPUT / f"{topic['number']}-{topic['slug']}.json"
    if output_path.exists():
        return f"{topic['number']}:existing"
    last_error = None
    for attempt in range(3):
        try:
            response = client.chat.completions.create(
                model="gpt-5",
                messages=[{"role": "system", "content": SYSTEM}, {"role": "user", "content": prompt(topic)}],
                max_completion_tokens=10000,
                extra_body={"reasoning": {"effort": "medium"}},
                response_format={"type": "json_schema", "json_schema": {"name": "reader_edition_content", "strict": True, "schema": SCHEMA}},
            )
            data = json.loads(response.choices[0].message.content)
            validate(data)
            data["topic"] = topic
            output_path.write_text(json.dumps(data, ensure_ascii=False, indent=2))
            return topic["number"]
        except Exception as error:
            last_error = error
            time.sleep(4 * (attempt + 1))
    raise last_error

if __name__ == "__main__":
    pending = [topic for topic in TOPICS if not (OUTPUT / f"{topic['number']}-{topic['slug']}.json").exists()]
    with concurrent.futures.ThreadPoolExecutor(max_workers=1) as pool:
        completed = list(pool.map(draft, pending))
    print("DRAFTED", ",".join(completed))
