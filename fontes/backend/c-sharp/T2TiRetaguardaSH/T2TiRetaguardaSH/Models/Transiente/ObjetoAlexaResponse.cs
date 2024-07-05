namespace T2TiRetaguardaSH.Models
{
	public class AlexaOutputSpeech
	{
		public AlexaOutputSpeech() { }

		public string Type { get; set; }
		public string Text { get; set; }
		public string PlayBehavior { get; set; }
	}

	public class AlexaResponse
	{
		public AlexaResponse() { }

		public bool ShouldEndSession { get; set; }
		public AlexaOutputSpeech OutputSpeech { get; set; }
	}

	public class ObjetoAlexaResponse
	{
        public ObjetoAlexaResponse() { }

		public string Version { get; set; }
		public AlexaResponse Response { get; set; }
	}
}
