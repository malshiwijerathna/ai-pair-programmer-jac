"""
AI Pair Programming Tool - Complete Implementation
Demonstrates Steps 5 & 6: Scale-Agnostic Design + AI Integration with MTLLM
Assignment submission for Jac in 5 Minutes demonstration
"""

import:py random;
import:py datetime;
import:py from mtllm.llm, Model;

# Global LLM model for AI assistance
glob llm = Model(model_name="gemini/gemini-2.0-flash-exp", verbose=False);

# AI-powered functions using MTLLM
can analyze_code(code: str, language: str) -> str by llm(
    "You are an expert code reviewer. Analyze the given code and provide specific, actionable feedback about code structure, potential issues, performance optimizations, and best practices. Be concise but thorough."
);

can generate_code(requirements: str, language: str) -> str by llm(
    "You are an expert programmer. Generate clean, well-commented, production-ready code based on the given requirements. Follow best practices and include proper error handling."
);

can debug_code(code: str, error_message: str, language: str) -> str by llm(
    "You are an expert debugger. Analyze the code and error message, then provide specific solutions to fix the issue. Explain the root cause and suggest preventive measures."
);

can explain_code(code: str, language: str) -> str by llm(
    "You are an expert programming teacher. Explain what this code does in clear, simple terms. Break down complex concepts and highlight important programming patterns or techniques used."
);

# Walker for handling programming assistance requests
walker ProgrammingAssistant {
    has request_type: str;
    has code: str = "";
    has language: str = "python";
    has requirements: str = "";
    has error_message: str = "";
    has session_id: str = "";

    can start with `root entry {
        print(f"Starting AI Programming Assistant: {self.session_id}");
        print(f"Request type: {self.request_type}");
        print(f"Language: {self.language}");
        print("=" * 60);
        
        # Process based on request type with AI integration
        if self.request_type == "analyze" {
            print(f"ANALYZING CODE");
            print(f"Code to analyze:\n{self.code}");
            print("\nAI Analysis in progress...");
            
            analysis_result = analyze_code(self.code, self.language);
            print(f"\nAI Analysis Result:\n{analysis_result}");
            
        } elif self.request_type == "generate" {
            print(f"GENERATING CODE");
            print(f"Requirements: {self.requirements}");
            print("\nAI Code Generation in progress...");
            
            generated_code = generate_code(self.requirements, self.language);
            print(f"\nGenerated Code:\n{generated_code}");
            
        } elif self.request_type == "debug" {
            print(f"DEBUGGING CODE");
            print(f"Code with error:\n{self.code}");
            print(f"Error: {self.error_message}");
            print("\nAI Debugging in progress...");
            
            debug_suggestions = debug_code(self.code, self.error_message, self.language);
            print(f"\nDebug Suggestions:\n{debug_suggestions}");
            
        } elif self.request_type == "explain" {
            print(f"EXPLAINING CODE");
            print(f"Code to explain:\n{self.code}");
            print("\nAI Explanation in progress...");
            
            explanation = explain_code(self.code, self.language);
            print(f"\nCode Explanation:\n{explanation}");
            
        } else {
            print(f"Unknown request type: {self.request_type}");
        }
        
        print("=" * 60);
        print("Session completed!\n");
    }
}

# Demo scenarios showcasing AI capabilities
with entry:__main__ {
    print("AI Pair Programming Tool - MTLLM Integration Demo");
    print("Demonstrating Steps 5 & 6 from 'Jac in 5 Minutes'");
    print("Assignment Submission for Jaseci World Seminar\n");
    
    # 1. Code Analysis with Real AI
    print("1. SMART CODE ANALYSIS");
    root spawn ProgrammingAssistant(
        request_type="analyze",
        code="def fibonacci(n):\n    if n <= 1:\n        return n\n    return fibonacci(n-1) + fibonacci(n-2)",
        language="python",
        session_id="analysis_demo"
    );
    
    # 2. Intelligent Code Generation
    print("2. INTELLIGENT CODE GENERATION");
    root spawn ProgrammingAssistant(
        request_type="generate",
        requirements="Create a REST API endpoint that handles user authentication with JWT tokens and includes rate limiting",
        language="python",
        session_id="generation_demo"
    );
    
    # 3. AI-Powered Debugging
    print("3. AI-POWERED DEBUGGING");
    root spawn ProgrammingAssistant(
        request_type="debug",
        code="def calculate_average(numbers):\n    total = sum(numbers)\n    return total / len(numbers)",
        error_message="ZeroDivisionError: division by zero when numbers list is empty",
        language="python",
        session_id="debug_demo"
    );
    
    # 4. Context-Aware Code Explanation
    print("4. CONTEXT-AWARE EXPLANATION");
    root spawn ProgrammingAssistant(
        request_type="explain",
        code="@decorator\ndef memoize(func):\n    cache = {}\n    def wrapper(*args, **kwargs):\n        key = str(args) + str(kwargs)\n        if key not in cache:\n            cache[key] = func(*args, **kwargs)\n        return cache[key]\n    return wrapper",
        language="python",
        session_id="explanation_demo"
    );
}
