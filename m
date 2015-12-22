Return-Path: <twoerner@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 030E3731D7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:24:08 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id k90so123786519qge.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 20:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=9OzaFHRs682D9PoNG2SQZHoUk6U81MZVjdTEOpoNgMw=;
	b=U79R8dAc6fDrwiMwz9pz8eDta1sxj+mFBbkW0+TrLca3K6Izp7FxNPucvPkUWGvCL4
	jsk6NXrlIEh1kpBCSxPSA7Lwnnum8W0ikX8+vYWfYjZWFpMhp3mioiHJz91CxZw9qGH1
	gc83E1Ief4rcKJtQ24cLzh60VLre6i81OnI8TLuoYCet0rxHaJvn9fqkeNkr8PDY2HTU
	7Q996y9Hi3dqaY0Lw3lU0Go16j72+Jt3y90Ndyfeqi+reQWT6RFVFJqfmAIldXKSOJUM
	Z4FMTLHpTmrpYtazuKui4iZay4hNJow4Z4BAjZDb8RAivTgdm+rPikXOLxVOTRDYR4X1
	REaQ==
X-Received: by 10.140.255.10 with SMTP id a10mr31423789qhd.103.1450758249322; 
	Mon, 21 Dec 2015 20:24:09 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	o51sm6593494qge.34.2015.12.21.20.24.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Dec 2015 20:24:08 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1450757450-17359-1-git-send-email-twoerner@gmail.com>
	<1450757450-17359-2-git-send-email-twoerner@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <5678D061.3080200@gmail.com>
Date: Mon, 21 Dec 2015 23:24:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1450757450-17359-2-git-send-email-twoerner@gmail.com>
Subject: Re: [meta-oe][PATCH v3 1/1] nodejs: cleanup and update
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
X-List-Received-Date: Tue, 22 Dec 2015 04:24:09 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Oops, sent to wrong list. resending...

