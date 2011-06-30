Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qc8HK-0007JC-Ll
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 05:50:58 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jun 2011 20:47:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,447,1304319600"; d="scan'208";a="22160963"
Received: from unknown (HELO [10.255.14.13]) ([10.255.14.13])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2011 20:47:14 -0700
Message-ID: <4E0BF1C2.6000607@linux.intel.com>
Date: Wed, 29 Jun 2011 20:47:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1308193566.git.sgw@linux.intel.com>
In-Reply-To: <cover.1308193566.git.sgw@linux.intel.com>
Subject: Re: [PATCH 0/1] Change gconf-dbus to a src tarball
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
X-List-Received-Date: Thu, 30 Jun 2011 03:50:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2011 08:18 PM, Saul Wold wrote:
> Richard,
>
> The current gconf-dbus has gone away, this causes issues with
> builds and autobuilder.
>
> Sau!
>
>
> The following changes since commit 34f4f9eae8c588234b29e44f5a3ea9edbc10620d:
>
>    eglibc: bump PR for SRCREV changes (2011-06-15 14:30:23 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib sgw/gconf-fix
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/gconf-fix
>
> Saul Wold (1):
>    gconf-dbus: Fix SRC_URI to tarball
>
>   .../gnome/{gconf-dbus_svn.bb =>  gconf-dbus_705.bb} |   11 ++++++++---
>   1 files changed, 8 insertions(+), 3 deletions(-)
>   rename meta/recipes-gnome/gnome/{gconf-dbus_svn.bb =>  gconf-dbus_705.bb} (69%)
>

Merged into oe-core

Thanks to myself


