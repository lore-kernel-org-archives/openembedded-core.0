Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 24B2371A41
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 03:02:55 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP; 05 Oct 2016 20:02:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,451,1473145200"; d="scan'208";a="16705667"
Received: from gdhillon-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.156.169])
	by fmsmga005.fm.intel.com with ESMTP; 05 Oct 2016 20:02:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 06 Oct 2016 16:02:50 +1300
Message-ID: <3333865.u7YMqIlQip@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.5-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <b712b5e2-a8df-5520-900c-2ff543619304@windriver.com>
References: <CABcZAN=WpicbLyg-sc=GDiMS81iwsGe1m+NE-fUfw2tniWpWXA@mail.gmail.com>
	<1780562.gdzQvQrqZ4@peggleto-mobl.ger.corp.intel.com>
	<b712b5e2-a8df-5520-900c-2ff543619304@windriver.com>
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 06 Oct 2016 03:02:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 04 Oct 2016 12:22:56 Randy MacLeod wrote:
> On 2016-10-02 03:37 PM, Paul Eggleton wrote:
> >> "native" might be a bit too generic...
> >> 
> >> > >> could I suggest oe_native-run or bitbake-native ?
> >> > >> 
> >> > >> something that says it's yocto-galaxy specific and can be
> >> > >> autocompleted
> >> > >> with a reasonable prefix...
> 
> I also prefer an oe prefix.
> oe-native, oe-run-native, or oe-exec-native would work for me.

Well, someone needs to send a patch, any volunteers?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

