Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 93A32737F2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 01:42:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3A1gq8k000119
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Apr 2015 18:42:53 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 9 Apr 2015 18:42:52 -0700
Message-ID: <55272A9B.5010701@windriver.com>
Date: Fri, 10 Apr 2015 09:42:51 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1427964751.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1427964751.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] grub-efi: add PACKAGECONFIG for grub-mount and device-mapper
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
X-List-Received-Date: Fri, 10 Apr 2015 01:42:53 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping.

// Robert

On 04/02/2015 04:55 PM, Robert Yang wrote:
> The following changes since commit e6aab245623b6ba1ca5f06632d1028c863cef737:
>
>    image_types: Add missing ext4 support (2015-03-31 22:38:50 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/grub
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/grub
>
> Robert Yang (1):
>    grub-efi: add PACKAGECONFIG for grub-mount and device-mapper
>
>   meta/recipes-bsp/grub/grub2.inc    |    4 ++++
>   meta/recipes-bsp/grub/grub_2.00.bb |    4 ----
>   meta/recipes-bsp/grub/grub_git.bb  |    4 ----
>   3 files changed, 4 insertions(+), 8 deletions(-)
>

