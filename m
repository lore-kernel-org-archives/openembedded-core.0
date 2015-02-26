Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D1DD171637
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 22:35:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 26 Feb 2015 14:35:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,655,1418112000"; d="scan'208";a="460049914"
Received: from rbarry-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.22.31])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Feb 2015 14:20:15 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Feb 2015 22:35:50 +0000
Message-ID: <3098634.xUVi2ZDfg6@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.7-100.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <CAJTo0Lao_XRie0O_Kb+Cw6-Zh-q+d--XJti6ogbu=WeUqmQhmw@mail.gmail.com>
References: <cover.1424877305.git.cristian.iorga@intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F443500@irsmsx105.ger.corp.intel.com>
	<CAJTo0Lao_XRie0O_Kb+Cw6-Zh-q+d--XJti6ogbu=WeUqmQhmw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] meta/lib/oe/utils.py: properly implement both_contain()
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
X-List-Received-Date: Thu, 26 Feb 2015 22:35:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 26 February 2015 20:34:36 Burton, Ross wrote:
> On 26 February 2015 at 20:19, Iorga, Cristian <cristian.iorga@intel.com>
> 
> wrote:
> > Can you point me to a tutorial in this kind of test suites?
> 
> I sure can, see meta/lib/oe/tests/test_utils.py.  Should be fairly obvious.

Genuine question, which I should have asked last time those files were touched 
- how do those tests relate to oe-selftest tests?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

