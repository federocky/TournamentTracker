using System;
using System.Collections.Generic;
using System.Text;
using TrackerLibrary.Model;

namespace TrackerUI
{
    public interface IPrizeRequester
    {
        void PrizeComplete(PrizeModel model);
    }
}
