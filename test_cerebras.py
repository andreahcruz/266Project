"""Quick check that CEREBRAS_API_KEY + CEREBRAS_MODEL work (loads .env from repo root)."""

from dotenv import load_dotenv
import os

load_dotenv()

from openai import OpenAI


def main():
    key = os.getenv("CEREBRAS_API_KEY")
    if not key:
        print("Set CEREBRAS_API_KEY in .env")
        return
    base = os.getenv("CEREBRAS_BASE_URL", "https://api.cerebras.ai/v1")
    model = os.getenv("CEREBRAS_MODEL", "llama3.1-8b")
    print(f"Using model={model!r} base_url={base!r}")

    client = OpenAI(api_key=key, base_url=base)
    r = client.chat.completions.create(
        model=model,
        messages=[{"role": "user", "content": "Reply with exactly: OK"}],
        temperature=0,
        max_tokens=32,
    )
    print("Cerebras OK:", r.choices[0].message.content)


if __name__ == "__main__":
    main()
