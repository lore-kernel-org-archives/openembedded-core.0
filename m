Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QqPHO-0005hq-BB for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 14:50:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78CjYal002710
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Aug 2011 13:45:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02202-03 for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2011 13:45:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78CjRcP002704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Aug 2011 13:45:27 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <0cd89db93d0ae7fad4b1f4f07fa9b371415f5a58.1312773154.git.lei.mei@intel.com>
References: <cover.1312773154.git.lei.mei@intel.com>
	<0cd89db93d0ae7fad4b1f4f07fa9b371415f5a58.1312773154.git.lei.mei@intel.com>
Date: Mon, 08 Aug 2011 13:44:57 +0100
Message-ID: <1312807497.14274.175.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] lsb: Fix hard code libdir issue for multilib
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
X-List-Received-Date: Mon, 08 Aug 2011 12:50:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-08 at 11:22 +0800, Mei Lei wrote:
> Signed-off-by: Mei Lei <lei.mei@intel.com>
> ---
>  meta/recipes-extended/lsb/lsb_1.4.bb |   18 +++++++++---------
>  1 files changed, 9 insertions(+), 9 deletions(-)

Merged to master, thanks.

Richard



