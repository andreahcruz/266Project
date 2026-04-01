from dotenv import load_dotenv
import os

load_dotenv()

# ── GROQ TEST ──────────────────────────────────────────
def test_groq():
    from groq import Groq
    
    client = Groq(api_key=os.getenv("GROQ_API_KEY"))
    
    response = client.chat.completions.create(
        model="llama-3.3-70b-versatile",
        messages=[{"role": "user", "content": "say hello in one word"}]
    )
    
    print("✅ GROQ WORKS:", response.choices[0].message.content)

# ── GEMINI TEST ─────────────────────────────────────────
def test_gemini():
    import google.generativeai as genai
    
    genai.configure(api_key=os.getenv("GEMINI_API_KEY"))
    model = genai.GenerativeModel("gemini-2.0-flash")
    
    response = model.generate_content("say hello in one word")
    
    print("✅ GEMINI WORKS:", response.text)

# ── RUN BOTH ────────────────────────────────────────────
if __name__ == "__main__":
    print("Testing Groq...")
    test_groq()
    
    print("Testing Gemini...")
    test_gemini()