Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D691F6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 02:22:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5D2MAiM025323
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 19:22:11 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 12 Jun 2016 19:22:10 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1465720945.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <575E18D0.9050707@windriver.com>
Date: Mon, 13 Jun 2016 10:22:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1465720945.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] python-mako: rm -df -> rmdir
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
X-List-Received-Date: Mon, 13 Jun 2016 02:22:11 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Rebased to for mako_1.0.4.bb:

git://git.openembedded.org/openembedded-core-contrib rbt/rm

// Robert

On 06/12/2016 04:42 PM, Robert Yang wrote:
> The following changes since commit 207dba5b6eb04c1ae2081bac06724b3b6a198cb3:
>
>    oe-pkgdata-util: fix AttributeError (2016-06-07 21:36:09 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/rm
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/rm
>
> Robert Yang (1):
>    python-mako: rm -df -> rmdir
>
>   meta/recipes-devtools/python/python-mako_1.0.3.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>

