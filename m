Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9A1376E766
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2014 11:59:31 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s18BxCN0010833; Sat, 8 Feb 2014 11:59:12 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nARzNDO-q8M0; Sat,  8 Feb 2014 11:59:12 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s18Bx9MJ010829
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sat, 8 Feb 2014 11:59:11 GMT
Message-ID: <1391860744.32614.52.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laszlo Papp <lpapp@kde.org>
Date: Sat, 08 Feb 2014 11:59:04 +0000
In-Reply-To: <CAOMwXhMUuS2-dV1xe0YWFxOeD08ByUHHm8DPaqeT=4jAFzHXVA@mail.gmail.com>
References: <1391598835-1631-1-git-send-email-lpapp@kde.org>
	<52F25D84.6060501@linux.intel.com>
	<CAOMwXhMUuS2-dV1xe0YWFxOeD08ByUHHm8DPaqeT=4jAFzHXVA@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/recipes-core/base-passwd/base-passwd/noshadow.patch: Split it into two parts
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
X-List-Received-Date: Sat, 08 Feb 2014 11:59:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-02-08 at 11:50 +0000, Laszlo Papp wrote:
> Saul, would it be possible that you leave a short message on the
> mailing list in the corresponding thread if a change is merged to
> avoid such things in the future?

We did used to do this but it turns out to be a nightmare for Saul and
myself (the people who usually end up dealing with the patches) to do.
Its relatively easily to update checkouts and note if a patch was
merged.

Cheers,

Richard




