Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlEiu-0001NE-KD
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 08:05:21 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Jan 2012 22:57:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="95551062"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by orsmga001.jf.intel.com with ESMTP; 11 Jan 2012 22:57:49 -0800
Message-ID: <4F0E846C.5060802@linux.intel.com>
Date: Wed, 11 Jan 2012 22:57:48 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325882211.git.jessica.zhang@intel.com>
In-Reply-To: <cover.1325882211.git.jessica.zhang@intel.com>
Subject: Re: [PATCH 0/1] Add --sysroot settings into env file for build dir toolchain
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
X-List-Received-Date: Thu, 12 Jan 2012 07:05:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2012 12:40 PM, Jessica Zhang wrote:
> The following changes since commit 05409821ea58915c38a0962fb4dd14f8a49806e6:
>    Scott Garman (1):
>          insane.bbclass: use bb.process.Popen instead of subprocess.check_output
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib jzhang/sysroot
>    http://git.yoctoproject.org/cgit.cgi//log/?h=jzhang/sysroot
>
> Jessica Zhang (1):
>    add sysroot support for meta-ide-support which is the toolchain
>      within build env case
>
>   meta/classes/toolchain-scripts.bbclass |    9 +++++----
>   1 files changed, 5 insertions(+), 4 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core

Thanks
	Sau!


