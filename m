Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QqPI0-0005jZ-SN for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 14:50:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78Ck9Lb002719
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Aug 2011 13:46:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02217-04 for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2011 13:46:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78Ck01G002713
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Aug 2011 13:46:01 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <696fed3a310deeee270fe56faaced91ff4403818.1312774699.git.lianhao.lu@intel.com>
References: <cover.1312774699.git.lianhao.lu@intel.com>
	<696fed3a310deeee270fe56faaced91ff4403818.1312774699.git.lianhao.lu@intel.com>
Date: Mon, 08 Aug 2011 13:45:31 +0100
Message-ID: <1312807531.14274.176.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] multilib.conf: Supported multilib extend in more recipes.
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
X-List-Received-Date: Mon, 08 Aug 2011 12:50:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-08 at 11:39 +0800, Lianhao Lu wrote:
> Added more recipes supporting multilib extend.
> 
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  meta/conf/multilib.conf |  449 +++++++++++++++++++++++++++++++++++++++++++++--
>  1 files changed, 436 insertions(+), 13 deletions(-)

Merged to master, thanks.

Richard



