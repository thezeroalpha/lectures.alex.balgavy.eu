+++
title = 'Operator overloading'
+++
# Operator overloading
an operator is just a function with different syntax
you cannot define any new operators

ex:

```c++
enum class Month{
	jan=1, feb, mar, apr, may, jun, jul, aug, sept, oct, nov, dec
};

vector<string> month_table {“January”, “February”, ..etc};

ostream& operator<<(ostream& os, Month m) {
	return os << month_table[int(m)-1];
}

int main() {
	Month m {Month::dec};
	cout << m;

	// returns “December”
}
```
