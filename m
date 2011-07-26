Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qlj0B-00064p-Ua for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 16:52:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6QEmhp4022354
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 15:48:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22177-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 15:48:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6QEmYF0022348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 15:48:34 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <f7fda63d4b69592f85b4d2817755519be8e1b774.1311669316.git.dongxiao.xu@intel.com>
References: <cover.1311669316.git.dongxiao.xu@intel.com>
	<f7fda63d4b69592f85b4d2817755519be8e1b774.1311669316.git.dongxiao.xu@intel.com>
Date: Tue, 26 Jul 2011 15:48:26 +0100
Message-ID: <1311691706.2344.257.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] Upstream-Status: Add Upstream-Status for some missing patches
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
X-List-Received-Date: Tue, 26 Jul 2011 14:52:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-26 at 16:36 +0800, Dongxiao Xu wrote:
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> ---
>  .../connman/connman-gnome/3g.patch                 |    2 ++
>  .../flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch   |    2 ++
>  .../lame/lame-3.98.4/no-gtk1.patch                 |    2 ++
>  .../libtheora/libtheora-1.1.1/no-docs.patch        |    2 ++
>  .../libtiff/files/libtool2.patch                   |    2 ++
>  .../pulseaudio/libatomics-ops/doublefix.patch      |    2 ++
>  .../fedora/libatomic_ops-1.2-ppclwzfix.patch       |    5 +++++
>  .../gentoo/libatomic_ops-1.2-mips.patch            |    4 ++++
>  8 files changed, 21 insertions(+), 0 deletions(-)

Merged to master, thanks.

Richard



