Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BBABC719EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 06:27:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBL6RXhq002147
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Dec 2016 22:27:33 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Dec 2016 22:27:33 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1481767010.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <b1587230-e2a0-0ba4-feb4-92707aa74508@windriver.com>
Date: Wed, 21 Dec 2016 14:27:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <cover.1481767010.git.liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] selftest/bbtests.py: update test_bitbake_g()
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
X-List-Received-Date: Wed, 21 Dec 2016 06:27:33 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Ross,

I rebased in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/test
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/test

Robert Yang (1):
   selftest/bbtests.py: update test_bitbake_g()

// Robert

On 12/15/2016 09:57 AM, Robert Yang wrote:
> The following changes since commit 91f856426c7523e1ebdf6d6f93f5fa7e509d6e49:
>
>   oeqa/utils/commands.py: Fix get_bb_vars() when called without arguments (2016-12-14 16:14:59 +0000)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib rbt/test
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/test
>
> Robert Yang (1):
>   selftest/bbtests.py: update test_bitbake_g()
>
>  meta/lib/oeqa/selftest/bbtests.py | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>

