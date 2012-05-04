Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SQMNY-0004Cc-Nl
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 19:33:16 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 May 2012 10:23:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="140178649"
Received: from unknown (HELO [10.255.12.171]) ([10.255.12.171])
	by orsmga002.jf.intel.com with ESMTP; 04 May 2012 10:23:28 -0700
Message-ID: <4FA41090.9060301@linux.intel.com>
Date: Fri, 04 May 2012 10:23:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1336138307.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1336138307.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/1] Buildhistory fix
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
X-List-Received-Date: Fri, 04 May 2012 17:33:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2012 06:36 AM, Paul Eggleton wrote:
> This fix should also go into 1.2.1.
>
>
> The following change since commit 0be64cda0a20ca3aab75ee0cc360236d2dc40c95:
>
>    gcc-package-target: add libexec for plugin (2012-05-03 15:38:07 +0100)
>
> is available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-commit
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-commit
>
> Paul Eggleton (1):
>    buildhistory: fix multiple commit of images and packages at the same
>      time
>
>   meta/classes/buildhistory.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!


