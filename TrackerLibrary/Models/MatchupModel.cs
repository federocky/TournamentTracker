using System;
using System.Collections.Generic;
using System.Text;

namespace TrackerLibrary.Model
{
    public class MatchupModel
    {
        public MatchupModel()
        {
            this.Entries = new List<MatchupEntryModel>();
        }

        public int Id { get; set; }
        public List<MatchupEntryModel> Entries { get; set; }
        public int WinnerId { get; set; }
        public TeamModel Winner { get; set; }
        public int MatchupRound { get; set; }
    }
}
