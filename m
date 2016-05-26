Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9B64973257;
	Thu, 26 May 2016 20:14:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 26 May 2016 13:14:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,369,1459839600"; d="scan'208";a="985439066"
Received: from ktan57-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.172.96])
	by orsmga002.jf.intel.com with ESMTP; 26 May 2016 13:14:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Cliff Brake <cbrake@bec-systems.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 27 May 2016 08:14:28 +1200
Message-ID: <3785754.gtfDI8MhLU@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.9-300.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAOd_LFwLw9QMk4YdpbE2aD5k3CwiWQfcqhczdFM4=iBGhFQ98A@mail.gmail.com>
References: <1464054649898.9b34c448@Nodemailer>
	<20160524092336.GA27824@mbabyjoh-desk.ger.corp.intel.com>
	<CAOd_LFwLw9QMk4YdpbE2aD5k3CwiWQfcqhczdFM4=iBGhFQ98A@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [oe] OE Changelog since 2016-05-15 until 2016-05-22
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
X-List-Received-Date: Thu, 26 May 2016 20:14:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thu, 26 May 2016 13:46:21 Cliff Brake wrote:
> On Tue, May 24, 2016 at 5:23 AM, Maxin B. John <maxin.john@intel.com> wrote:
> > meta-java repo was moved to:
> > git://git.yoctoproject.org/meta-java
> > 
> > Is it possible to update the list with that info?
>
> Done, thanks!
> 
> https://github.com/cbrake/openembedded-admin/commit/51604da79ed5a02341562a9b
> f254b3dd9dc71704

At some point it would be great if this script could be driven from the OE 
layer index rather than being a separate entity - then updates would largely 
be self-service for the maintainers, or at least they would only need to be 
done in one place.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

