Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF50782DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 16:37:29 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w1JGbS82010033
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 19 Feb 2018 16:37:29 GMT
Message-ID: <1519058248.24236.259.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, Bruce Ashfield
	<bruce.ashfield@windriver.com>
Date: Mon, 19 Feb 2018 16:37:28 +0000
In-Reply-To: <a2083091-1169-4ab3-1aba-55a1fc4cf2c0@gmail.com>
References: <1519054841-4986-1-git-send-email-bruce.ashfield@windriver.com>
	<a2083091-1169-4ab3-1aba-55a1fc4cf2c0@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2][rocko] linux-yocto/4.12: update to v4.12.20
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
X-List-Received-Date: Mon, 19 Feb 2018 16:37:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-02-19 at 08:16 -0800, akuster808 wrote:
> Bruce,
> 
> thanks. I hand applied this as I have another kernel change sitting
> in
> stable/rocko-next
> 
> I will build this once RP is done with master

You correctly pointed out I needed to sort master first! :)

Bruce: Is there an update for 4.9 in rocko? If so we should perhaps
pull that in too before we rebuild 2.4.2?

(and thanks for the 4.12 fixes, I was going to ask about them but Armin
beat me to it)

Cheers,

Richard

