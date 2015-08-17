Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0493B65CBC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 07:14:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7H7EYoa020912
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 00:14:34 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 17 Aug 2015 00:14:34 -0700
Message-ID: <55D189D9.8030606@windriver.com>
Date: Mon, 17 Aug 2015 15:14:33 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1436951753.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1436951753.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/2] insane.bbclass: fix package_qa_check_buildpaths
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
X-List-Received-Date: Mon, 17 Aug 2015 07:14:37 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping.

// Robert

On 07/15/2015 05:16 PM, Robert Yang wrote:
> The following changes since commit 6be698b7270f73f40d38713ecf13f12aec0ced61:
>
>    dpkg: Fix for Fedora22 and new versions of tar (2015-07-13 13:46:45 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/buildpath
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/buildpath
>
> Robert Yang (2):
>    insane.bbclass: fix package_qa_check_buildpaths
>    insane.bbclass: make package_qa_clean_path return a relative path
>
>   meta/classes/insane.bbclass |   14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
>

