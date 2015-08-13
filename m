Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F214D73231
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 07:20:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7D7K2ZE028391
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 00:20:02 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 13 Aug 2015 00:20:01 -0700
Message-ID: <55CC4520.5070104@windriver.com>
Date: Thu, 13 Aug 2015 15:20:00 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1439449677.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1439449677.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] fetch2/git.py: fix _latest_revision for local PREMIRROR
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
X-List-Received-Date: Thu, 13 Aug 2015 07:20:07 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Sorry, please ignore this one, wrong mailing list.

// Robert

On 08/13/2015 03:08 PM, Robert Yang wrote:
> The following changes since commit 64da20b8555350e1b0d761c36499532e83ca9827:
>
>    multilib_global.bbclass: fix PREFERRED_VERSION for cross-canadian (2015-08-12 23:51:13 -0700)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib rbt/auto
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/auto
>
> Robert Yang (1):
>    fetch2/git.py: fix _latest_revision for local PREMIRROR
>
>   bitbake/lib/bb/fetch2/git.py |    7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>

