Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RCBbX-00033t-Al for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 16:40:51 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97EfhP6011245 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Oct 2011 15:41:43 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2-gt-aFaRhSJ
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2011 15:41:43 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97Efdk5011218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Oct 2011 15:41:40 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 07 Oct 2011 15:35:00 +0100
In-Reply-To: <5930749806604b40d1dd6c36ec4b44c2507b4493.1317925433.git.sgw@linux.intel.com>
References: <cover.1317925433.git.sgw@linux.intel.com>
	<5930749806604b40d1dd6c36ec4b44c2507b4493.1317925433.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317998108.8533.0.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] acl/attr: don't make symlink if base_libdir = libdir
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
X-List-Received-Date: Fri, 07 Oct 2011 14:40:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-06 at 11:25 -0700, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-support/attr/ea-acl.inc |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)

Merged to master, thanks.

Richard



