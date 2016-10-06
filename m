Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 48BCB719D8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 03:29:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 05 Oct 2016 20:29:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,451,1473145200"; d="scan'208";a="769381518"
Received: from gdhillon-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.156.169])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Oct 2016 20:29:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ulf Magnusson <ulfalizer@gmail.com>
Date: Thu, 06 Oct 2016 16:29:23 +1300
Message-ID: <1604968.YxicQtadVG@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.5-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAFkk2KSEJ6wc528YqZROFFtUCkQ=NPtJgOT+nKJXDLVefJ5t=w@mail.gmail.com>
References: <CABcZAN=WpicbLyg-sc=GDiMS81iwsGe1m+NE-fUfw2tniWpWXA@mail.gmail.com>
	<3333865.u7YMqIlQip@peggleto-mobl.ger.corp.intel.com>
	<CAFkk2KSEJ6wc528YqZROFFtUCkQ=NPtJgOT+nKJXDLVefJ5t=w@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] scripts: add new script 'native'
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
X-List-Received-Date: Thu, 06 Oct 2016 03:29:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thu, 06 Oct 2016 05:20:20 Ulf Magnusson wrote:
> On Thu, Oct 6, 2016 at 5:02 AM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > On Tue, 04 Oct 2016 12:22:56 Randy MacLeod wrote:
> >> On 2016-10-02 03:37 PM, Paul Eggleton wrote:
> >> >> "native" might be a bit too generic...
> >> >> 
> >> >> > >> could I suggest oe_native-run or bitbake-native ?
> >> >> > >> 
> >> >> > >> something that says it's yocto-galaxy specific and can be
> >> >> > >> autocompleted
> >> >> > >> with a reasonable prefix...
> >> 
> >> I also prefer an oe prefix.
> >> oe-native, oe-run-native, or oe-exec-native would work for me.
> > 
> > Well, someone needs to send a patch, any volunteers?
> > 
> > Cheers,
> > Paul
> 
> Sent one (and caved in to peer pressure re. the prefix).

Thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

