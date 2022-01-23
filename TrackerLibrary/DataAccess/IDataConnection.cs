using System;
using System.Collections.Generic;
using System.Text;
using TrackerLibrary.Model;

namespace TrackerLibrary.DataAccess
{
    public interface IDataConnection
    {
        PrizeModel CreatePrize(PrizeModel model);
        PersonModel CreatePerson(PersonModel model);
        TeamModel CreateTeam(TeamModel model);
        TournamentModel CreateTournament(TournamentModel model);
        List<PersonModel> GetPerson_All();
        List<TeamModel> GetTeam_All();
    }
}
