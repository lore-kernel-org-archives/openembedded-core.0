Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD5F77142
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 05:48:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u785n0Sd015743
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Aug 2016 22:49:00 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 7 Aug 2016 22:48:59 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1469605567.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57A81D4A.1060002@windriver.com>
Date: Mon, 8 Aug 2016 13:48:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1469605567.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] packagefeed-stability.bbclass: fix multilib + rpm
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
X-List-Received-Date: Mon, 08 Aug 2016 05:48:59 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping.

// Robert

On 07/27/2016 03:51 PM, Robert Yang wrote:
> The following changes since commit b32d430c3c7dccf3a8d06ab492d648893a05950f:
>
>    dpkg: use snapshot.debian.org for SRC_URI (2016-07-26 08:56:08 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/feed
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/feed
>
> Robert Yang (1):
>    packagefeed-stability.bbclass: fix multilib + rpm
>
>   meta/classes/packagefeed-stability.bbclass | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
>

