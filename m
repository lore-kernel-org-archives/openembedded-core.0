Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2C765F1E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 07:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7L7cGPJ024540; Thu, 21 Aug 2014 08:38:16 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nqf_LggQaeuc; Thu, 21 Aug 2014 08:38:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7L7cAn3024535
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 21 Aug 2014 08:38:12 +0100
Message-ID: <1408606690.1669.103.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>
Date: Thu, 21 Aug 2014 08:38:10 +0100
In-Reply-To: <1408316808-13486-1-git-send-email-akuster808@gmail.com>
References: <1408316808-13486-1-git-send-email-akuster808@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] nettle: update nettle to version 3.0
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
X-List-Received-Date: Thu, 21 Aug 2014 07:38:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2014-08-17 at 16:06 -0700, Armin Kuster wrote:
> With this update, LGPLv3 or GPLv3 where  added to many files.
> Each supported algorithms govern which license they want.
> Many are stated as  "ether v2 or v3 or both in parallel".
> Update license to be v2 or LGPLv3 or GPLv3.
> 
> The previous verion had one GPLv3 file so the license was incorrect.

With this change, "bitbke gnutls" stops working.

Cheers,

Richard


