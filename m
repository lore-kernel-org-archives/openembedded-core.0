Return-Path: <niqingliang2003@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 776BD6B1C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 05:29:19 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id 4so282291pdd.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 22:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=l5XKqSoLb3MigN8MbKZWE61FZP1Oz+zJWyW9fYY67Ac=;
	b=LlnErLAB8GOTgjw29zLu4HrRoKAiBxLbFOoP049U72TLLMd7ffDigjR7wR13Vh03kd
	82Ax+KFAE2NfSYjZay8LWTpxohlvtIVt8BFbKDKrULzVj9QeSILbmmleWP3WiI+08ktY
	2kExR9QaHCWnnlxvKCR85qBwFLHavVPE5F2q4Hv/ix3YxPlIxdI6qt44duaidEU5T8oM
	UiMY4cavKrrvGvqA2f2jBBR24tyNmWL5fex80+ODt/dBc9vb0TeNoNrJSj9M/yJK8W0y
	1Xn/Wtac5tH2ZlC1K70O0TXkx0E+lUD32Xb8hG8MOKoct1BcGsfS0z32z5QoHjgv42go
	mWWg==
X-Received: by 10.68.201.163 with SMTP id kb3mr7049040pbc.22.1373952559701;
	Mon, 15 Jul 2013 22:29:19 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([180.109.91.249])
	by mx.google.com with ESMTPSA id eg3sm2047654pac.1.2013.07.15.22.29.16
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Jul 2013 22:29:18 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Tue, 16 Jul 2013 13:24:34 +0800
Message-ID: <1583654.sNKEILZnlI@yiqingliang-pc>
User-Agent: KMail/4.10.4 (Linux/3.9.8-1-ARCH; KDE/4.10.4; x86_64; ; )
In-Reply-To: <3096832.OcaoZJbLJn@helios>
References: <1494076.GQbbvjWTEm@yiqingliang-pc> <3096832.OcaoZJbLJn@helios>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qt 4.8.5 package error
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
X-List-Received-Date: Tue, 16 Jul 2013 05:29:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, July 15, 2013 09:48:15 AM Paul Eggleton wrote:
> On Monday 15 July 2013 09:12:23 Yi Qingliang wrote:
> > hello,
> > 
> > 	I'm using latest poky, when packaging qte, got following error, any idea?
> > 
> 
> Please pull the latest changes, this has been switched back to a warning.

it was latest already, two days before.
I just updated it , no new commit.
maybe you can tell me which commit switched it back to warning?
thanks!

> 
> Cheers,
> Paul
-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com

