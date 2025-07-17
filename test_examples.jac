"""
Test Examples for AI Pair Programming Tool
Demonstrates various use cases and request types
"""

include:jac ai_pair_programmer;

# Test different programming assistance scenarios
with entry:__main__ {
    print("=== Extended Test Examples ===\n");
    
    # Test 1: Code Analysis - Complex function
    print("Test 1: Analyzing a complex sorting function");
    root spawn ProgrammingAssistant(
        request_type="analyze",
        code="""
def bubble_sort(arr):
    n = len(arr)
    for i in range(n):
        for j in range(0, n-i-1):
            if arr[j] > arr[j+1]:
                arr[j], arr[j+1] = arr[j+1], arr[j]
    return arr
        """,
        language="python",
        session_id="test_session_1"
    );
    
    print("\n" + "="*50 + "\n");
    
    # Test 2: Code Generation - Data structure
    print("Test 2: Generating a binary search tree implementation");
    root spawn ProgrammingAssistant(
        request_type="generate",
        requirements="Create a binary search tree class with insert, search, and delete methods",
        language="python",
        session_id="test_session_2"
    );
    
    print("\n" + "="*50 + "\n");
    
    # Test 3: Debugging - Index error
    print("Test 3: Debugging an index error");
    root spawn ProgrammingAssistant(
        request_type="debug",
        code="""
def get_last_element(lst):
    return lst[len(lst)]
        """,
        error_message="IndexError: list index out of range",
        language="python",
        session_id="test_session_3"
    );
    
    print("\n" + "="*50 + "\n");
    
    # Test 4: Code Explanation - List comprehension
    print("Test 4: Explaining a complex list comprehension");
    root spawn ProgrammingAssistant(
        request_type="explain",
        code="result = [x**2 for x in range(10) if x % 2 == 0 and x > 2]",
        language="python",
        session_id="test_session_4"
    );
    
    print("\n" + "="*50 + "\n");
    
    # Test 5: JavaScript Analysis
    print("Test 5: Analyzing JavaScript async function");
    root spawn ProgrammingAssistant(
        request_type="analyze",
        code="""
async function fetchData(url) {
    try {
        const response = await fetch(url);
        const data = await response.json();
        return data;
    } catch (error) {
        console.error('Error fetching data:', error);
        return null;
    }
}
        """,
        language="javascript",
        session_id="test_session_5"
    );
    
    print("\n=== All Tests Completed ===");
}