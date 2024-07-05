namespace T2TiRetaguardaSH.Models
{
	public class AlexaSession
	{
		public AlexaSession() { }
		public bool New{ get; set; }
		public string SessionId { get; set; }
	}

	public class AlexaContext
	{
		public AlexaContext() { }
	}

	public class AlexaSlotObjeto
	{
		public AlexaSlotObjeto() { }
		public string Name { get; set; }
		public string Value { get; set; }
		public string ConfirmationStatus { get; set; }
	}

	public class AlexaSlot
	{
		public AlexaSlot() { }

		public AlexaSlotObjeto NomeUsuario { get; set; }
	}

	public class AlexaIntent
	{
		public AlexaIntent() { }

		public string Name { get; set; }
		public string ConfirmationStatus { get; set; }
		public AlexaSlot Slots { get; set; }
	}

	public class AlexaRequest
	{
		public AlexaRequest() { }

		public string Type { get; set; }
		public string RequestId { get; set; }
		public string Timestamp { get; set; }
		public string Locale { get; set; }
		public string DialogState { get; set; }
		public AlexaIntent Intent { get; set; }
	}

	public class ObjetoAlexaRequest
    {
        public ObjetoAlexaRequest() { }

		public string Version { get; set; }
		public AlexaSession Session { get; set; }
		public AlexaContext Context { get; set; }
		public AlexaRequest Request { get; set; }
	}
}
