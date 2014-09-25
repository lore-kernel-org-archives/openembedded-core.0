Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 3B35A609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 09:07:21 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 25 Sep 2014 11:07:17 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 9F5B92884E9;
	Thu, 25 Sep 2014 11:07:17 +0200 (CEST)
Date: Thu, 25 Sep 2014 11:07:17 +0200
From: "Maxin B. John" <maxin.john@enea.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20140925090717.GA55044@sestofb10.enea.se>
References: <1410360202-22215-1-git-send-email-maxin.john@enea.com>
	<CAJTo0La08fHpt1vJT+Kj97PVT1iDievLPVyEdwZy6ZKykrC8NQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0La08fHpt1vJT+Kj97PVT1iDievLPVyEdwZy6ZKykrC8NQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: upgrade to 7.38.0
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
X-List-Received-Date: Thu, 25 Sep 2014 09:07:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Ross,

On Wed, Sep 24, 2014 at 11:27:57PM +0100, Burton, Ross wrote:
> On 10 September 2014 15:43, Maxin B. John <maxin.john@enea.com> wrote:
> > Fixes two HTTP cookie related security bugs:
> >  1. CVE-2014-3613
> >  2. CVE-2014-3620
> 
> Can these be backported instead to 7.37.1?  Upgrading to a new major
> release with many new features is exceptional now we've frozen.
Sure. I will backport and send it soon.
 
> Ross
Best Regards,
Maxin


