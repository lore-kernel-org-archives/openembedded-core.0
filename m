Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7BB0E609C1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Apr 2014 01:31:18 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id wp18so2312356obc.36
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 18:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=O4Hibt2+dryU4LZxTkqCu7mk3fuoiSYekNxvwPbi5cw=;
	b=NYnOu4pAWEsnwo8W0oTUwIW6z1B9WvxRhI8WVmtWydIK5hhk9sUYwvBz2Bjp1hoKNj
	xCQCw+ABb2SWxjMJZzIcrNkvzHwOC/hV5q1QSwnbSMycdzsT6SXD+iSia1bL6mcbs+A0
	D0p4fWpyNScdn4S5kiF9OHc1Qr++2mQIhEYM5VMUdnJuM8vx4lmHy5b9WT7g1QfX1VJW
	U2hjuYjmwcy/U3v6gGQMO0Lt5pvqS0VmOJU803I/4f8YnJR1/6CZJT2abiDgMq1hEU+M
	Wmy5t5TBQMkJLiosy42+ibHU+vfdp2upI58OVNS8EqTywx5RhRUmTHz/vLnJAWhNjKyY
	zSfA==
X-Gm-Message-State: ALoCoQk194rhsxN88hrxEjvyyJSBs9N7FyAkC+RXlEwNMi23qAe4ftPG+ewZ9xZlbUPh502g8+P7
X-Received: by 10.182.102.134 with SMTP id fo6mr19531843obb.10.1397871078934; 
	Fri, 18 Apr 2014 18:31:18 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id f1sm133397255oej.5.2014.04.18.18.31.17
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 18 Apr 2014 18:31:18 -0700 (PDT)
Message-ID: <5351D1E5.2020302@linaro.org>
Date: Fri, 18 Apr 2014 21:31:17 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
References: <20140418183632.GG2486@jama>
In-Reply-To: <20140418183632.GG2486@jama>
Subject: Re: State of bitbake world, test-dependencies 2014-04-18
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
X-List-Received-Date: Sat, 19 Apr 2014 01:31:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Martin,

Just to confirm... when we work on this, we should be working against
master-next?

Best regards,
    Trevor

