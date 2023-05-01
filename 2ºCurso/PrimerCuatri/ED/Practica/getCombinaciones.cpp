void bolsaLetras::getCombinaciones(string set, string prefix, int k, string &total){

	// Base case: k is 0,
	// print prefix
	if (k == 0)
	{
		total += prefix + "\n";
		return;
	}

	// One by one add all characters
	// from set and recursively
	// call for k equals to k-1
	for (size_t i = 0; i < set.size(); i++)
	{
		string newPrefix;

		// Next character of input added
		newPrefix = prefix + set.at(i);

		// k is decreased, because
		// we have added a new character
		getCombinaciones(set, newPrefix, k - 1, total);
	}

}
