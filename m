Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TOzU3-0003sF-W9
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 01:26:36 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Oct 2012 16:13:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,609,1344236400"; d="scan'208";a="235751611"
Received: from unknown (HELO [10.255.14.107]) ([10.255.14.107])
	by fmsmga001.fm.intel.com with ESMTP; 18 Oct 2012 16:13:14 -0700
Message-ID: <50808D0A.8090103@linux.intel.com>
Date: Thu, 18 Oct 2012 16:13:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@googlemail.com>
References: <1350394101-15120-1-git-send-email-schnitzeltony@googlemail.com>
In-Reply-To: <1350394101-15120-1-git-send-email-schnitzeltony@googlemail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] gnome-icon-them bugfixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Oct 2012 23:26:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/16/2012 06:28 AM, Andreas Müller wrote:
> It caused me a lot headache to load gtk-stock-icons...
>
> Andreas Müller (2):
>    gnome-icon-theme: fix icon mapping
>    gnome-icon-theme: remove unused configure variable
>
>   .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
Andreas,

I am having some trouble with the patches include, I think thunderbird 
is trying to encode them in non-ascii, can you resend or point me at a 
rebased branch.  I just made some changes in this also.

Also, does sato-icon-theme need the same changes?

Thanks
	Sau!


