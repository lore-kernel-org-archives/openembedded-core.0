Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 690A1729F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 01:42:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3A1gKL6028763
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Apr 2015 18:42:20 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 9 Apr 2015 18:42:19 -0700
Message-ID: <55272A7A.5030703@windriver.com>
Date: Fri, 10 Apr 2015 09:42:18 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1427683823.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1427683823.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] pcmciautils: fix for parallel build
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
X-List-Received-Date: Fri, 10 Apr 2015 01:42:20 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping.

// Robert

On 03/30/2015 10:50 AM, Robert Yang wrote:
> The following changes since commit 2d923d6dfe9431dbc005f8ba39838eb4519c471c:
>
>    python-pygobject: Disable parallel make install in native case (2015-03-25 12:38:44 +0000)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/pcmciautils
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/pcmciautils
>
> Robert Yang (1):
>    pcmciautils: fix for parallel build
>
>   .../Makefile-fix-for-parallel-build.patch          |   10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>

