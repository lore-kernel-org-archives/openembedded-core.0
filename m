Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C145E6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 21:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u96LNCrP027948; Thu, 6 Oct 2016 22:23:12 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id js1CqWfO-fqB; Thu,  6 Oct 2016 22:23:12 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u96LNBl5027945
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 6 Oct 2016 22:23:12 +0100
Message-ID: <1475788991.30475.610.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <saul.wold@intel.com>, openembedded-core@lists.openembedded.org
Date: Thu, 06 Oct 2016 22:23:11 +0100
In-Reply-To: <1475787557.18115.216.camel@intel.com>
References: <1474985736-17783-1-git-send-email-sgw@linux.intel.com>
	<1475787557.18115.216.camel@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: Ross Burton <ross@linux.intel.com>
Subject: Re: [PATCH][Jethro] init-install.sh: fix disk_size
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Oct 2016 21:25:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-10-06 at 13:59 -0700, Saul Wold wrote:
> Ping

Didn't this merge on 27th September?

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=jethro&id=2ff9d30da
c1d0734547b0793bd5d1efb00d00f4e

Cheers,

Richard

