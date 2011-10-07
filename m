Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RCBbv-000358-QM for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 16:41:16 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97Eg6hP011271 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Oct 2011 15:42:06 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 73LmcyGULOxZ
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2011 15:42:06 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97Eg3XX011250
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Oct 2011 15:42:05 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 07 Oct 2011 15:35:25 +0100
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317998133.8533.1.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 00/21] Add SRC_URI Checksums and some Updates
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
X-List-Received-Date: Fri, 07 Oct 2011 14:41:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-06 at 09:14 -0700, Saul Wold wrote:
> Richard,
> 
> Found some recipes missing Checksums and do a couple of
> package updates.
> 
> Thanks
> Sau!
> 
> The following changes since commit cc626b9e1671670a931ea3e528ea4b0f7b2e923b:
> 
>   webkit-gtk: Enable dependency tracking since the webkit makefiles have bugs (2011-10-05 14:36:18 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/updates
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates
> 
> Saul Wold (21):
>   grub: Add SRC_URI Checksum
>   dosfstools: Add SRC_URI Checksum
>   libx11-trim: Add SRC_URI Checksum
>   guilt-native: Add SRC_URI Checksums
>   libx11-diet: Add SRC_URI Checksum
>   eds-tools: Convert from BZR to GIT Repo
>   clutter-gst-1.6: Add SRC_URI Checksum
>   xserver-kdrive: Add SRC_URI Checksum
>   mutter: Add SRC_URI Checksum
>   icon-naming-utils: Add SRC_URI Checksum
>   libxml-perl: Add SRC_URI Checksum
>   liburi-perl: Add SRC_URI Checksum
>   gconf-dbus: Add SRC_URI Checksum
>   gail: Add SRC_URI Checksum
>   boost-jam-native: Add SRC_URI Checksum
>   puzzles: Update to latest version
>   gnutls: Update to 2.12.11
>   tzdata: Update to 2011k
>   lsof: Update to 4.84
>   apt: Update to 0.8.15.8
>   distro_tracking: Updates

Merged to master apart from the apt change.

Thanks,

Richard



