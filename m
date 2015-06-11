Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B5986758D6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 09:26:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5B9QWqL010757
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 02:26:33 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 11 Jun 2015 02:26:32 -0700
Message-ID: <55795446.9030106@windriver.com>
Date: Thu, 11 Jun 2015 17:26:30 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1434013599.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1434013599.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] beecrypt: DEPENDS on icu
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
X-List-Received-Date: Thu, 11 Jun 2015 09:26:35 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Sorry, please drop this patch, we don't need it, I met this
error when I made something wrong in base.bbclass.

// Robert

On 06/11/2015 05:07 PM, Robert Yang wrote:
> The following changes since commit 7f85e74d5c53b34e5f470967fdbdbd19fed1929a:
>
>    sysvinit: Only enable recipe in builds where its applicable (2015-06-10 12:03:14 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/beecrypt
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/beecrypt
>
> Robert Yang (1):
>    beecrypt: DEPENDS on icu
>
>   meta/recipes-support/beecrypt/beecrypt_4.2.1.bb |    2 ++
>   1 file changed, 2 insertions(+)
>

