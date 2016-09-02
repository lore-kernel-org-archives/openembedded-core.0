Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E158877112
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 12:54:51 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 02 Sep 2016 05:54:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,270,1470726000"; d="scan'208";a="874471743"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga003.jf.intel.com with ESMTP; 02 Sep 2016 05:54:50 -0700
Date: Fri, 2 Sep 2016 15:54:36 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20160902125436.GA31153@mbabyjoh-desk.ger.corp.intel.com>
References: <lya8ftx7w4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1472662673.29583.90.camel@linuxfoundation.org>
	<ly60qgxzp3.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LafVEqcVF02+naw8JvbzF2fi2y+Ws=OH0+=OgAyDNSt1A@mail.gmail.com>
	<ly1t12xyjs.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <ly1t12xyjs.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Replacement for tslib?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Sep 2016 12:54:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Enrico,

On Fri, Sep 02, 2016 at 02:43:03PM +0200, Enrico Scholz wrote:
> "Burton, Ross" <ross.burton@intel.com> writes:
> 
> > tslib is still available in meta-oe,
> 
> really?  In fef7b1feb79c7b43623760e2cdf4e68bd0dbd526, a
> 
> | find -name '*tslib*'
> 
> returns only xf86-input-tslib, but not plain tslib.

Patches are on it's way:
http://lists.openembedded.org/pipermail/openembedded-devel/2016-September/108945.html

Initial discussions here:
http://lists.openembedded.org/pipermail/openembedded-devel/2016-August/108428.html

Sorry for the trouble. 

> 
> Enrico

Best Regards,
Maxin

