Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 087EC6E64A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 08:53:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u728rYTp010359
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2016 01:53:34 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 2 Aug 2016 01:53:33 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1461033288.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57A05F8C.9080409@windriver.com>
Date: Tue, 2 Aug 2016 16:53:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1461033288.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/3] create-pull-request: 3 improvements (master branch only)
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
X-List-Received-Date: Tue, 02 Aug 2016 08:53:34 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Ping.

// Robert

On 04/19/2016 10:45 AM, Robert Yang wrote:
> The following changes since commit e003ef038819c10f351bb8268b377626c95bb077:
>
>    toasterconf.json: Update for krogoth release (2016-04-18 16:48:58 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/cpr
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/cpr
>
> Robert Yang (3):
>    create-pull-request: create branch on remote if not found
>    create-pull-request: read remote from env var CONTRIB_REMOTE
>    create-pull-request: set subject automatically for cover latter
>
>   scripts/create-pull-request | 78 +++++++++++++++++++++++++--------------------
>   1 file changed, 43 insertions(+), 35 deletions(-)
>

