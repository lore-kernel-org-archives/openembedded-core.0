Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rvsw9-0005q3-Lf
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 17:03:01 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2012 07:54:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116345579"
Received: from unknown (HELO [10.255.14.208]) ([10.255.14.208])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2012 07:54:54 -0800
Message-ID: <4F353DCE.7070204@linux.intel.com>
Date: Fri, 10 Feb 2012 07:54:54 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1328703672.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1328703672.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 0/2] Patches pending from O.S. Systems' tree
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
X-List-Received-Date: Fri, 10 Feb 2012 16:03:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2012 04:22 AM, Otavio Salvador wrote:
> This has removed the map_dependencies from the cross class as we were
> handling those by hand anyway in meta-chicken.
>
> The following changes since commit 06b740d4ca077fb4c89ee6d1065fabb02da45ec6:
>
>    classes/buildhistory: sort list fields in package info (2012-02-08 10:43:01 +0000)
>
> are available in the git repository at:
>    git://github.com/OSSystems/oe-core master
>    https://github.com/OSSystems/oe-core/tree/HEAD
>
> Otavio Salvador (2):
>    cross.bbclass: add virtclass handler
>    useradd.bbclass: skip processing on virtclass-cross extended packages
>
>   meta/classes/cross.bbclass   |   17 +++++++++++++++++
>   meta/classes/useradd.bbclass |    3 +++
>   2 files changed, 20 insertions(+), 0 deletions(-)
>

Merged to OE-core

Thanks
	Sau!


