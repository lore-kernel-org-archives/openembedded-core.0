Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2A63F62135
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Apr 2016 10:00:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u33A0g7r019959
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 3 Apr 2016 03:00:42 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 3 Apr 2016 03:00:42 -0700
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1459677330.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5700E9C8.10501@windriver.com>
Date: Sun, 3 Apr 2016 18:00:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1459677330.git.liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1 V2] linux-yocto 4.4: enable overlayfs by default
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
X-List-Received-Date: Sun, 03 Apr 2016 10:00:46 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Add Bruce in the loop.

// Robert

On 04/03/2016 05:58 PM, Robert Yang wrote:
> * V2
>    Rebase the patch based on Bruce's recent changes on kernel.
>
> * V1
>    Initial version.
>
> // Robert
>
> The following changes since commit 322904f62f11e794543362f04212242567c556a0:
>
>    selftest/signing: Use packagedata to obtain PR value for signing test (2016-03-31 23:55:13 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib 637f6783157bb0e9449d153133485401bcf2dbb1
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=637f6783157bb0e9449d153133485401bcf2dbb1
>
> Robert Yang (1):
>    linux-yocto 4.4: enable overlayfs by default
>
>   meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb | 2 +-
>   meta/recipes-kernel/linux/linux-yocto_4.4.bb    | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>

