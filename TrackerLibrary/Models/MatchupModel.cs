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
        public string DisplayName 
        {
            get
            {
                string output = "";
                foreach (MatchupEntryModel me in Entries)
                {
                    if (me.TeamCompeting != null)
                    {
                        if (output.Length == 0)
                        {
                            output = me.TeamCompeting.TeamName;
                        }
                        else
                        {
                            output += $" vs. { me.TeamCompeting.TeamName }";
                        } 
                    }
                    else
                    {
                        output = "Matchup Not Yet Determined";
                        break;
                    }
                }

                return output;
            }
        }
    }
}
