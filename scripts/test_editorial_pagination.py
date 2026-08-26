from generate_editorial_future_library import editorial_page


def test_editorial_sections_are_fresh_page_units() -> None:
    pages = [
        editorial_page(
            13,
            "The Evidence-First Resume Bullet",
            "Make proof easier to evaluate.",
            "COMPLETE EDITION",
            page_no,
            12,
            ["A focused editorial argument.", "A practical test."],
        )
        for page_no in (1, 2)
    ]
    rendered = "".join(pages)
    assert rendered.count("#page(") == 2
    assert all(page.startswith("#page(") and page.rstrip().endswith("]") for page in pages)
    assert all(page.index("The Evidence-First Resume Bullet") > page.index("#line(length: 100%") for page in pages)
    assert all("\n    #text(font: \"Noto Sans\", size: 8pt" not in page for page in pages)


if __name__ == "__main__":
    test_editorial_sections_are_fresh_page_units()
    print("editorial pagination test passed")
