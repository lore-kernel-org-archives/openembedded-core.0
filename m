Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFDMb-0006Z7-83
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 01:42:13 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Apr 2012 16:33:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="128394527"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by orsmga002.jf.intel.com with ESMTP; 03 Apr 2012 16:33:02 -0700
Message-ID: <4F7B88AE.5040407@linux.intel.com>
Date: Tue, 03 Apr 2012 16:33:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1332848153.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1332848153.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/3] Fixes for bitbake wrapper script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2012 23:42:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/27/2012 04:50 AM, Paul Eggleton wrote:
> Andreas, if you could review these that would be much appreciated.
>
>
> The following changes since commit 644b7503c37fd73730dd3d7841463b158b8934ed:
>
>    guile: Deal with hardcoded path issues (2012-03-27 00:28:41 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/builddir
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/builddir
>
> Paul Eggleton (3):
>    scripts/bitbake: try harder to check if pseudo exists
>    scripts/bitbake: allow switching between build directories
>    scripts/bitbake: add/fix some comments
>
>   scripts/bitbake |   43 ++++++++++++++++++++++++++++++++-----------
>   1 files changed, 32 insertions(+), 11 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


