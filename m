Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 67B40601A8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Oct 2014 13:34:20 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Wed, 1 Oct 2014
	15:34:21 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id D1A4F288D4E;
	Wed,  1 Oct 2014 15:34:21 +0200 (CEST)
Date: Wed, 1 Oct 2014 15:34:21 +0200
From: "Maxin B. John" <maxin.john@enea.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20141001133421.GA61237@sestofb10.enea.se>
References: <1411644990-20122-1-git-send-email-maxin.john@enea.com>
	<CAJTo0LbhFF0g1swk1y250QOESwvjmJcuPcbZNvX_ESJTMt3GKA@mail.gmail.com>
	<20140925171754.GA7840@sestofb10.enea.se>
	<CAJTo0LbXWbR=P==Na2tZ5+rmMKqoKfESu9rHUV-HK7LOsiJUZQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbXWbR=P==Na2tZ5+rmMKqoKfESu9rHUV-HK7LOsiJUZQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: Security Advisory - CVE-2014-3613 & CVE-2014-3620
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
X-List-Received-Date: Wed, 01 Oct 2014 13:34:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Ross,

On Thu, Sep 25, 2014 at 10:07:37PM +0100, Burton, Ross wrote:
> On 25 September 2014 18:17, Maxin B. John <maxin.john@enea.com> wrote:
> > I have tried it with the latest master and it "worked for me".
> > Could you please confirm if it was applied on the "master" branch ?
> > (Couldn't recreate this failure at my PC)
> 
> I applied this patch to origin/master
> (8ac8eca2e3bd8c78e2b31ea974930ed0243258a3) and it still fails to apply
> the patches at build time with rejects in tests/data/test31.

Mea culpa. Sent an updated patch now.

> 
> Ross
Thanks and Regards,
Maxin

