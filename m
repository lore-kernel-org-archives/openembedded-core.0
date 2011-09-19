Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R5ggU-0006wn-Ro
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 18:27:07 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Sep 2011 09:21:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,406,1312182000"; d="scan'208";a="55327695"
Received: from unknown (HELO [10.255.14.150]) ([10.255.14.150])
	by fmsmga002.fm.intel.com with ESMTP; 19 Sep 2011 09:21:49 -0700
Message-ID: <4E776C1D.2060204@linux.intel.com>
Date: Mon, 19 Sep 2011 09:21:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1316192786.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1316192786.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/2] Konsole handling
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
X-List-Received-Date: Mon, 19 Sep 2011 16:27:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/16/2011 10:08 AM, Paul Eggleton wrote:
> The following changes since commit 20529035a4c0befb3c6bdbcb289a2de930fb143d:
>
>    bugzilla.bbclass: add a class to report build problems to bugzilla (2011-09-16 17:36:27 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/konsole
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/konsole
>
> Paul Eggleton (2):
>    lib/oe/terminal.py: declare konsole from KDE 4.x as unsupported
>    sanity.bbclass: add a sanity check for KDE 4.x konsole in TERMCMD
>
>   meta/classes/sanity.bbclass |    6 ++++++
>   meta/lib/oe/terminal.py     |   27 +++++++++++++++++++++++++++
>   2 files changed, 33 insertions(+), 0 deletions(-)
>
Merged to OE-Core

Thanks
	Sau!


