Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 31A967626C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 10:11:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 29 Jul 2015 03:11:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,569,1432623600"; d="scan'208";a="757253707"
Received: from kzamkov-mobl1.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.21.165])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jul 2015 03:11:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 29 Jul 2015 11:11:17 +0100
Message-ID: <5755146.lYtmNt1cvb@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.8-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <cover.1438161068.git.liezhi.yang@windriver.com>
References: <cover.1438161068.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] bitbake.conf: add GITHUB_GIT
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
X-List-Received-Date: Wed, 29 Jul 2015 10:11:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Robert,

On Wednesday 29 July 2015 02:11:53 Robert Yang wrote:
> The following changes since commit 27d068d05239c26a3848eb101571acab54635e37:
> 
>   harfbuzz: upgrade to 1.0.1 (2015-07-27 23:28:23 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib rbt/github
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/
> github
> 
> Robert Yang (2):
>   bitbake.conf: add GITHUB_GIT
>   meta: git://github.com -> ${GITHUB_GIT}

Interesting, but you don't explain why this change is needed in the commit 
messages.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

