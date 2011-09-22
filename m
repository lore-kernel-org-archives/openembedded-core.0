Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R6pYF-0008In-Kk for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 22:07:19 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8MK8EkQ029226 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 21:08:14 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sWSfSUPsjf9Z
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 21:08:14 +0100 (BST)
Received: from [192.168.250.158] ([116.246.20.131]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8MK87kT029222
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 21:08:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2011 21:01:51 +0100
In-Reply-To: <31b6f02d5186145a665535ba18531f57e3708ebd.1316718291.git.sgw@linux.intel.com>
References: <cover.1316718291.git.sgw@linux.intel.com>
	<31b6f02d5186145a665535ba18531f57e3708ebd.1316718291.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316721716.28323.3.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] gnome-desktop: Fix python path in scripts to use target path
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
X-List-Received-Date: Thu, 22 Sep 2011 20:07:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-22 at 12:05 -0700, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-gnome/gnome/gnome-desktop.inc |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



