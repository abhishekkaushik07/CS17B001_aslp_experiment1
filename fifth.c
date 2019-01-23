int main()
{
	int a[9]={2,5,4,3,7,9,8,1,6};
	int min=a[0];
	int max=a[0];

	int i;
	for(i=1;i<9;i++)
	{
		if(min>a[i])
		{
			min=a[i];
		}
		if(max<a[i])
		{
			max=a[i];
		}

	}





}
