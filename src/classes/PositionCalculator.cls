public virtual class PositionCalculator {

	public double calcHRA(position__c p)
	{
		return p.Min_Pay__c*0.3;
	}
}