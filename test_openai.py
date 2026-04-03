"""Quick check that OPENAI_API_KEY + OPENAI_MODEL work (loads .env from repo root)."""

from dotenv import load_dotenv
import os

load_dotenv()

from openai import OpenAI


def main():
    key = os.getenv("OPENAI_API_KEY")
    if not key:
        print("Set OPENAI_API_KEY in .env")
        return
    base = os.getenv("OPENAI_BASE_URL", "https://api.openai.com/v1")
    model = os.getenv("OPENAI_MODEL", "gpt-5.4-mini")
    print(f"Using model={model!r} base_url={base!r}")

    client = OpenAI(api_key=key, base_url=base)
    r = client.chat.completions.create(
        model=model,
        messages=[{"role": "user", "content": "Reply with exactly: OK"}],
        temperature=0,
        max_completion_tokens=32,
    )
    print("OpenAI OK:", r.choices[0].message.content)


if __name__ == "__main__":
    main()
