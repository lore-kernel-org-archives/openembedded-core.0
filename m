Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QenpX-0002Im-HR for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 14:37:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67CXSBx027817
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jul 2011 13:33:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27474-06 for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2011 13:33:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67CXJ6q027811
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jul 2011 13:33:19 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <033bcedc144922a1187ed4e9b6e8f480390f817f.1309785892.git.xiaofeng.yan@windriver.com>
References: <cover.1309785892.git.xiaofeng.yan@windriver.com>
	<033bcedc144922a1187ed4e9b6e8f480390f817f.1309785892.git.xiaofeng.yan@windriver.com>
Date: Thu, 07 Jul 2011 13:32:43 +0100
Message-ID: <1310041963.20015.822.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] libQtOpenGL:Add libQtOpenGL to an lsb image
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
X-List-Received-Date: Thu, 07 Jul 2011 12:37:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-05 at 16:40 +0800, Xiaofeng Yan wrote:
> I make "opengl" as a DISTO_FEATURE for installing libQtOpenGL to image.
> Fix Bug [YOCTO #1020]
> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Merged to master, thanks.

Richard



